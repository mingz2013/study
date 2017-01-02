package Lookup;
/**
 * 根据网址查询IP
 * 
 * **/

import java.net.InetAddress;

public class Lookup {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			if(args.length == 0){
				System.out.println("no args");
			}else{
				InetAddress address = InetAddress.getByName(args[0]);
				System.out.println(address);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Could not find " + args[0]);
		}

	}

}