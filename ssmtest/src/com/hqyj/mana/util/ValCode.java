package com.hqyj.mana.util;



import java.awt.Color;



import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Component;


/**
 * ��֤��������
 * @author wj
 *
 */
@Component
public class ValCode {

    // ͼƬ�Ŀ�ȡ�  
    private int width = 160;  
    // ͼƬ�ĸ߶ȡ�  
    private int height = 40;  
    // ��֤���ַ�����  
    private int codeCount = 4;  
    // ��֤���������  
    private int lineCount = 150;  
    // ��֤��  
    private String code = null;  


	// ͼƬ���� 
    private BufferedImage buffImg = null;  
  
    // ��֤�뷶Χ,ȥ��0(����)��O(ƴ��)���׻�����(Сд��1��LҲ����ȥ��,��д������)  
    private char[] codeSequence = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',  
            'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',  
            'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    
    public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
    
    /**
     * ������֤�ķ���
     */
    public void createCode() {  
    	//����������ͼ��Ҫ�ļ�������
        int x = 0;
        
        int red = 0, green = 0, blue = 0;  
        
        //�����ַ��ļ��
        x = width / (codeCount + 2);
    
   
  
        // ����һ������rgb��ɫͼƬ���� ,�������ͼƬ��������width*height,����rgb��ɫ��������ɫ
        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        //����һ����2Dͼ���󣬿������Ϊ����һ��������Ҫ�Ĺ��ߺ�
        Graphics2D g = buffImg.createGraphics();  
        
        //----------------�Ȼ�һ��������Ϊ��֤��ͼƬ����ɫ--------------------
        //���û��ʵ���ɫ���ó���ɫ����
        g.setColor(Color.green);  
        //����ɫ���ʻ�һ�����Σ�����0��0����ʼ���ʵ����꣬width,height��Ҫ�����εĿ�߶�
        g.fillRect(0, 0, width, height); 
        
        
        //-------------------�������߿�ʼ------------------------
        // �������������
        Random random = new Random();  
        //���ѭ���������ɸ����ߵ�
        for (int i = 0; i < lineCount; i++) {  
            // ���ɸ����ߵ��������,nextInt(100)�������������һ��1��100�������
            int xs = random.nextInt(width);//x���꿪ʼ  
            int ys = random.nextInt(height);//y���꿪ʼ  
            int xe = xs + random.nextInt(width / 8);//x�������  
            int ye = ys + random.nextInt(height / 8);//y�������  
  
            // �����������ɫֵ���������ÿ�������ߵ���ɫֵ������ͬ��  
            red = random.nextInt(255);  
            green = random.nextInt(255);  
            blue = random.nextInt(255); 
         
            //���ø����ߵ���ɫ
            g.setColor(new Color(red, green, blue)); 
            //����������
            g.drawLine(xs, ys, xe, ye);  
        }  
    
        
        
      //--------------------���ĸ��ַ�--------------------
        // �����������,���������ֱ������壬�����������С
        Font font = new Font("Courier", Font.PLAIN, 38);  
        //��������������
        g.setFont(font);  
        
        // ����һ��StringBuffer����������¼������֤���ֵ��
        StringBuffer randomCode = new StringBuffer();  
    
         //���ѭ��������������ַ���֤���
        for (int i = 0; i < codeCount; i++) {  
        	//���ȡ���ַ���codeSequenceȡһ���ַ���������ת�����ַ�������
            String strRand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]); 
            
            // �����������ɫֵ���������ÿ���ַ�����ɫֵ������ͬ��  
            red = random.nextInt(255);  
            green = random.nextInt(255);  
            blue = random.nextInt(255);  
            //�����ַ�����ɫ
            g.setColor(new Color(red, green, blue)); 
            //�����ַ������������ֱ��ǣ�Ҫ�����֣��ֵ�x����,y����
            g.drawString(strRand, (i + 1) * x, height - 4);  
            // ���������ĸ�����������һ��  
            randomCode.append(strRand); 
        
            
        }  
        System.out.println(randomCode);
        // ����λ���ֵ���֤�봫������code
        code = randomCode.toString();  
    }  
    /**
     * ����ͼƬ
     * @param sos
     * @throws IOException
     */
    public void write(OutputStream sos) throws IOException {  
    	//��buffImg����png��ʽ��ͼƬ��OutputStream���������ʽ
        ImageIO.write(buffImg, "png", sos); 
        //�ر���
        sos.close();    
    }  
    

}
