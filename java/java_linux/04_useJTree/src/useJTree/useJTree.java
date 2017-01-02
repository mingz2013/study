package useJTree;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;

public class useJTree {
	JFrame mm = new JFrame("樹");
	JTree tree;
	// 定义几个初始化节点
	DefaultMutableTreeNode root = new DefaultMutableTreeNode("AA");
	DefaultMutableTreeNode guangdong = new DefaultMutableTreeNode("BB");
	DefaultMutableTreeNode guangxi = new DefaultMutableTreeNode("CC");
	DefaultMutableTreeNode foshan = new DefaultMutableTreeNode("DD");
	DefaultMutableTreeNode shantou = new DefaultMutableTreeNode("EE");
	DefaultMutableTreeNode guilin = new DefaultMutableTreeNode("FF");
	DefaultMutableTreeNode nanning = new DefaultMutableTreeNode("GG");
	public void init() {
		// 通过add方法建立樹节点之间的父子关系
		guangdong.add(foshan);
		guangdong.add(shantou);
		guangxi.add(guilin);
		guangxi.add(nanning);
		root.add(guangdong);
		root.add(guangxi);
		// 以根节点创建樹
		tree = new JTree(root);
		// 默认连线
		//tree.putClientProperty("JTree.lineStyle", "Angeled");
		// 没有连线
		//tree.putClientProperty("JTree.lineStyle", "None");
		// 水平分割线
		tree.putClientProperty("JTree.lineStyle", "Horizontal");
		// 设置是否显示根节点的“展开/折叠”图标，默认是false
		tree.setShowsRootHandles(true);
		// 设置节点是否可见，默认true
		tree.setRootVisible(true);
		mm.add(new JScrollPane(tree));
		mm.pack();
		mm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		mm.setVisible(true);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new useJTree().init();
	}

}
