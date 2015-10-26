package test;

public class PcapTest {
	static {
		System.loadLibrary("pcaptest");
	}

	public static native void testLog(String logThis);
}
