import java.util.Scanner;

class HWDiv {
	public static void main(String[] args) {
		System.out.println("Hardware Division - A. Helvig\n");

		Scanner in = new Scanner(System.in);
		System.out.print("Dividend? ");
		int dividend = in.nextInt();
		System.out.print("Divisor? ");
		int divisor = in.nextInt();
		in.close();

		long result[] = hwdiv(dividend, divisor);

		System.out.printf("\nAlgo: %d / %d = %d, remainder = %d\n", dividend, divisor, result[0], result[1]);
		System.out.printf("Java: %d / %d = %d, remainder = %d\n", dividend, divisor, dividend / divisor, dividend % divisor);
	}

	private static long[] hwdiv(int dividend, int divisor) {
		if (divisor == 0) {
			throw new ArithmeticException("divide by zero");
		}

		long divisor64 = (long) divisor << 32;
		long result[] = new long[2];
		result[1] = (long) dividend;

		for (int i = 0; i < 33; i++) {
			result[1] -= divisor64;
			if (result[1] < 0) {
				result[1] += divisor64;
				result[0] <<= 1;
			} else {
				result[0] <<= 1;
				result[0] += 1;
			}
			divisor64 >>>= 1;
		}

		return result;
	}
}
