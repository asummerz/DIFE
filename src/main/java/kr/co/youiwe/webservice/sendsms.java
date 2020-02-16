package kr.co.youiwe.webservice;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service; 

public class sendsms {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		

		BufferedReader in;
	    in = new BufferedReader(new InputStreamReader(System.in));



		String smsID= "**********";	
		String smsPW="*********";
	
		
		ServiceSMSSoapProxy sendsms = new ServiceSMSSoapProxy();
		try{
		System.out.println("�����¹�ȣ�� �Է��ϼ���:");
		String senderPhone= in.readLine();
		System.out.println("�޴¹�ȣ�� �Է��ϼ���:");
		String receivePhone= in.readLine();
		System.out.println("�������� �Է��ϼ���:");
		String smsContent= in.readLine();
		String test1 = (smsID+smsPW+receivePhone);
		CEncrypt encrypt = new CEncrypt("MD5",test1);
		java.lang.String send=sendsms.sendSMS(smsID,encrypt.getEncryptData(), senderPhone, receivePhone, smsContent);
 		System.out.println("����ڵ�:"+send);
		}catch(Exception e){
		System.out.println("Exception in main:" +e);
		}
	}
}


  
class CEncrypt
{
    MessageDigest md;
    String strSRCData = "";
    String strENCData = "";

    public CEncrypt(){}
    //�ν��Ͻ� ���� �� �ѹ濡 ó���� �� �ֵ��� ������ �ߺ����׽��ϴ�. 
    public CEncrypt(String EncMthd, String strData)
    {
        this.encrypt(EncMthd, strData);
    }

    //��ȣȭ ������ �����ϴ� �޼ҵ��Դϴ�.
    public void encrypt(String EncMthd, String strData)
   {
       try
      {
          MessageDigest md = MessageDigest.getInstance(EncMthd); // "MD5" or "SHA1"
         byte[] bytData = strData.getBytes();
         md.update(bytData);

         byte[] digest = md.digest();
         StringBuffer sb = new StringBuffer();
         for(int i =0;i<digest.length;i++)
         {
        	 strENCData = sb.append(Integer.toString((digest[i]&0xff) + 0x100, 16).substring(1)).toString();
         }
       }catch(NoSuchAlgorithmException e)
      {
         System.out.print("��ȣȭ �˰����� �����ϴ�.");
      };
    
      //���߿� ���� �����Ͱ� �ʿ����� ���� ������ �Ӵϴ�.
      strSRCData = strData;
    }

    //������ �ζ��� �Լ�(�ƴ�, �޼ҵ�)���Դϴ�.
    public String getEncryptData(){return strENCData;}
    public String getSourceData(){return strSRCData;}

    //�����Ͱ� ������ �����ִ� �޼ҵ��Դϴ�.
    public boolean equal(String strData)
    {
      //��ȣȭ �����Ͷ� �񱳸� �ϴ�, �����̶� �񱳸� �ϴ� �����....
      if(strData == strENCData) return true;
      return false;
    }
	
}
