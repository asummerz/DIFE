package com.bit.dife03;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CEncrypt {
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
