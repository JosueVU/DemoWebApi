using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace INEC.TEMA1.COMUN
{
    public static class Encriptar
    {
        public static string keyStr = "PruebaInec2018.AbAbAb23";

        public static string Encrypt(string textToEncrypt)
        {
            RijndaelManaged rijndaelCipher = new RijndaelManaged();
            rijndaelCipher.Mode = CipherMode.CBC;
            rijndaelCipher.Padding = PaddingMode.PKCS7;

            rijndaelCipher.KeySize = 0x80;
            rijndaelCipher.BlockSize = 0x80;
            byte[] iv = { 1, 2, 3, 4, 5, 6, 6, 5, 4, 3, 2, 1, 7, 7, 7, 7 };
            byte[] pwdBytes = Encoding.UTF8.GetBytes(keyStr);
            byte[] keyBytes = new byte[0x10];
            int len = pwdBytes.Length;
            if (len > iv.Length)
            {
                len = iv.Length;
            }
            Array.Copy(pwdBytes, iv, len);
            rijndaelCipher.Key = iv;
            rijndaelCipher.IV = iv;
            ICryptoTransform transform = rijndaelCipher.CreateEncryptor();
            byte[] plainText = Encoding.UTF8.GetBytes(textToEncrypt);
            return Convert.ToBase64String(transform.TransformFinalBlock(plainText, 0, plainText.Length));
        }

        public static string Decrypt(string CipherText)
        {
            RijndaelManaged rijndaelCipher = new RijndaelManaged();
            rijndaelCipher.Mode = CipherMode.CBC;
            rijndaelCipher.Padding = PaddingMode.PKCS7;

            rijndaelCipher.KeySize = 0x80;
            rijndaelCipher.BlockSize = 0x80;
            byte[] iv = { 1, 2, 3, 4, 5, 6, 6, 5, 4, 3, 2, 1, 7, 7, 7, 7 };
            byte[] encryptedData = Convert.FromBase64String(CipherText);
            byte[] pwdBytes = Encoding.UTF8.GetBytes(keyStr);
            //byte[] keyBytes = new byte[0x10];
            int len = pwdBytes.Length;
            if (len > iv.Length)
            {
                len = iv.Length;
            }
            Array.Copy(pwdBytes, iv, len);
            rijndaelCipher.Key = iv;
            rijndaelCipher.IV = iv;
            byte[] plainText = rijndaelCipher.CreateDecryptor().TransformFinalBlock(encryptedData, 0, encryptedData.Length);
            return Encoding.UTF8.GetString(plainText);
        }
    }
}
