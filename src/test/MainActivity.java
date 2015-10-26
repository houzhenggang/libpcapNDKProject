package test;

import android.app.Activity;
import android.os.Bundle;

public class MainActivity extends Activity implements Runnable {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		new Thread(this).start();
	}

	@Override
	public void run() {
		PcapTest.testLog("PcapTest");
	}
}
