package yongProgressMonitor;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ProgressMonitor;
import javax.swing.Timer;

public class yongProgressMonitor {
	Timer timer;
	public void init()
	{
		final SimulatedTarget target = new SimulatedTarget(1000);
		// 以启动一条县城的方式来执行一个耗时的任务
		final Thread targetThread = new Thread(target);
		targetThread.start();
		// 创建进度对话框
		final ProgressMonitor dialog = new ProgressMonitor(null, "等待完成", "已完成", 0, target.getAmount());
		timer = new Timer(300, new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				// 以任务当前完成量设置进度对话框的完成比例
				dialog.setProgress(target.getCurrent());
				// 如果用户单击了进度对话框的“取消”按钮
				if(dialog.isCanceled())
				{
					// 停止计时器
					timer.stop();
					// 中断任务的执行进程
					targetThread.interrupt();
					// 系统推出
					System.exit(0);
				}
			}
		});
		timer.start();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new yongProgressMonitor().init();
	}

}
