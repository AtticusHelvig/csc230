import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Assembler {
	private static final boolean TEST_MODE = false;
	private static final Map<String, Byte> registerCodes = setRegisterCodes();
	private static final Map<String, Byte> instructionCodes = setInstructionCodes();
	private static final Map<String, Byte> functCodes = setFunctCodes();

	private static final byte SPECIAL = 0x0;

	public static void main(String[] args) {
		int count = 0;

		if (TEST_MODE) {
			testCases();
		} else {

			System.out.println("Assembler - A. Helvig\n");

			Scanner scan = new Scanner(System.in);

			while (true) {
				int translation;
				String operand = scan.next().toUpperCase();

				// End assembling when "HALT" reached
				if (operand.equals("HALT")) {
					break;
				}

				byte opcode = instructionCodes.get(operand);
				byte rs = 0, rt = 0, rd = 0, shamt = 0, funct = 0;
				short immed = 0;

				if (opcode == SPECIAL) {
					// regToByte is pretty pointless when using a Map implementation
					rd = regToByte(scan.next().toUpperCase());

					// Check for shift instructions
					funct = functCodes.get(operand);
					if (funct == 0x2 || funct == 0x0) {
						rt = regToByte(scan.next().toUpperCase());
						shamt = scan.nextByte();
					} else {
						rs = regToByte(scan.next().toUpperCase());
						rt = regToByte(scan.next().toUpperCase());
					}

					translation = makeR(opcode, rs, rt, rd, shamt, funct);
				} else {
					// Check for Store/Load instructions
					if (opcode == 0x23 || opcode == 0x2B) {
						rt = regToByte(scan.next().toUpperCase());
						immed = scan.nextShort();
						rs = regToByte(scan.next().toUpperCase());
					} else if (opcode == 0x4) { // Check for BEQ
						rs = regToByte(scan.next().toUpperCase());
						rt = regToByte(scan.next().toUpperCase());
						immed = scan.nextShort();
					} else {
						rt = regToByte(scan.next().toUpperCase());
						rs = regToByte(scan.next().toUpperCase());
						immed = scan.nextShort();
					}

					translation = makeI(opcode, rs, rt, immed);
				}

				System.out.println("***: " +
						String.format("%32s", Integer.toBinaryString(translation)).replace(" ", "0"));
				count++;

			}

			scan.close();
			System.out.println("\n*** Assembly complete. Program required " + count + " words of memory.");
		}
	}

	private static int makeR(byte opcode, byte rs, byte rt, byte rd, byte shamt, byte funct) {
		int returnValue = (opcode << 26) | (rs << 21) | (rt << 16) | (rd << 11) | (shamt << 6) | (funct);
		return returnValue;
	}

	private static int makeI(byte opcode, byte rs, byte rt, short immed) {
		// immed & 0xFFFF masks all but first 16 bits
		int returnValue = (opcode << 26) | (rs << 21) | (rt << 16) | (immed & 0xFFFF);
		return returnValue;
	}

	private static byte regToByte(String r) {
		return registerCodes.get(r);
	}

	private static Map<String, Byte> setInstructionCodes() {
		Map<String, Byte> codes = new HashMap<String, Byte>();
		codes.put("ADD", SPECIAL);
		codes.put("ADDI", (byte) 0x8);
		codes.put("AND", SPECIAL);
		codes.put("ANDI", (byte) 0xC);
		codes.put("BEQ", (byte) 0x4);
		codes.put("LW", (byte) 0x23);
		codes.put("SW", (byte) 0x2B);
		codes.put("SRL", SPECIAL);
		codes.put("SLL", SPECIAL);
		return codes;
	}

	private static Map<String, Byte> setFunctCodes() {
		Map<String, Byte> codes = new HashMap<String, Byte>();
		codes.put("ADD", (byte) 0x20);
		codes.put("AND", (byte) 0x24);
		codes.put("SRL", (byte) 0x2);
		codes.put("SLL", (byte) 0x0);
		return codes;
	}

	private static Map<String, Byte> setRegisterCodes() {
		Map<String, Byte> codes = new HashMap<String, Byte>();
		codes.put("$ZERO", (byte) 0);
		codes.put("$AT", (byte) 1);
		codes.put("$V0", (byte) 2);
		codes.put("$V1", (byte) 3);
		codes.put("$A0", (byte) 4);
		codes.put("$A1", (byte) 5);
		codes.put("$A2", (byte) 6);
		codes.put("$A3", (byte) 7);
		codes.put("$T0", (byte) 8);
		codes.put("$T1", (byte) 9);
		codes.put("$T2", (byte) 10);
		codes.put("$T3", (byte) 11);
		codes.put("$T4", (byte) 12);
		codes.put("$T5", (byte) 13);
		codes.put("$T6", (byte) 14);
		codes.put("$T7", (byte) 15);
		codes.put("$S0", (byte) 16);
		codes.put("$S1", (byte) 17);
		codes.put("$S2", (byte) 18);
		codes.put("$S3", (byte) 19);
		codes.put("$S4", (byte) 20);
		codes.put("$S5", (byte) 21);
		codes.put("$S6", (byte) 22);
		codes.put("$S7", (byte) 23);
		codes.put("$T8", (byte) 24);
		codes.put("$T9", (byte) 25);
		codes.put("$K0", (byte) 26);
		codes.put("$K1", (byte) 27);
		codes.put("$GP", (byte) 28);
		codes.put("$SP", (byte) 29);
		codes.put("$FP", (byte) 30);
		codes.put("$RA", (byte) 31);
		return codes;
	}

	/*************************************************************
	 *
	 * Test Code below
	 * Do NOT modify
	 * 
	 ************************************************************/

	private static void testCases() {
		if (test_regToByte())
			System.out.println("RegToByte working well\n");
		else
			System.out.println("RegToByte failed\n");

		if (test_makeR())
			System.out.println("makeR working well\n");
		else
			System.out.println("makeR failed\n");

		if (test_makeI())
			System.out.println("makeI working well\n");
		else
			System.out.println("makeI failed\n");
	}

	private static boolean test_regToByte() {
		boolean passedTest = true;
		String[] regs = { "$ZERO", "$AT", "$V0", "$V1", "$A0", "$A1", "$A2", "$A3", "$T0", "$T1", "$T2", "$T3", "$T4",
				"$T5", "$T6", "$T7", "$S0", "$S1", "$S2", "$S3", "$S4", "$S5", "$S6", "$S7", "$T8", "$T9" };

		for (int i = 0; i < regs.length; i++) {
			passedTest &= testReg(regs[i], i);
		}

		return passedTest;
	};

	private static boolean testReg(String regName, int expValue) {
		if (regToByte(regName) != expValue)
			System.out.printf("Fail: regToByte(\"%s\") = %d, should be %d\n", regName, regToByte(regName), expValue);
		return regToByte(regName) == expValue;
	}

	private static boolean test_makeR() {
		boolean passedTest = true;

		int i = makeR((byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1);
		if (i != 0b00000100001000010000100001000001) {
			System.out.println("Test: makeR(1,1,1,1,1,1) = " + Integer.toBinaryString(i) + " failed");
			passedTest = false;
		}

		i = makeR((byte) 63, (byte) 0, (byte) 31, (byte) 0, (byte) 31, (byte) 0);
		if (i != 0b11111100000111110000011111000000) {
			System.out.println("Test: makeR(63,0,31,0,31,0) = " + Integer.toBinaryString(i) + " failed");
			passedTest = false;
		}

		return passedTest;
	};

	private static boolean test_makeI() {
		boolean passedTest = true;

		int i = makeI((byte) 1, (byte) 1, (byte) 1, (short) 1);
		if (i != 0b00000100001000010000000000000001) {
			System.out.println("Test: makeI(1,1,1,1) = " + Integer.toBinaryString(i) + " failed");
			passedTest = false;
		}

		i = makeI((byte) 63, (byte) 0, (byte) 31, (short) 0);
		if (i != 0b11111100000111110000000000000000) {
			System.out.println("Test: makeI(63,0,31,0) = " + Integer.toBinaryString(i) + " failed");
			passedTest = false;
		}

		i = makeI((byte) 63, (byte) 0, (byte) 31, (short) -1);
		if (i != 0b11111100000111111111111111111111) {
			System.out.println("Test: makeI(63,0,31,-1) = " + Integer.toBinaryString(i) + " failed");
			passedTest = false;
		}

		return passedTest;
	};

}
