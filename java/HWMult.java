import java.util.Scanner;

class HWMult {
	public static void main(String[] args) {
		System.out.println("Hardware Multiply - A. Helvig\n");

		Scanner in = new Scanner(System.in);
		System.out.print("Multiplier? ");
		int multiplier = in.nextInt();
		System.out.print("Multiplicand? ");
		int multiplicand = in.nextInt();
		in.close();

		long result = hwmult(multiplier, multiplicand);
		System.out.printf("\nAlgo: %d x %d = %d\n", multiplier, multiplicand, result);
		System.out.printf("Java: %d x %d = %d\n", multiplier, multiplicand, (long) multiplier * (long) multiplicand);
	}

	private static long hwmult(int multiplier, int multiplicand) {
		long result = 0;
		long multiplicand64 = (long) multiplicand;

		while (multiplier != 0) {
			if ((multiplier & 1) == 1) {
				result += multiplicand64;
			}
			multiplier >>>= 1;
			multiplicand64 <<= 1;
		}

		return result;
	}
}
