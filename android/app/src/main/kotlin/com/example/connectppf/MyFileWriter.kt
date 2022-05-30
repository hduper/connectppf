package com.example.client

import java.io.BufferedOutputStream

class MyFileWriter {
    @Throws(IOException::class)
    fun writeFile(fileName: String?, inputStream: InputStream): Int {
        val f = File(fileName)
        val bos = BufferedOutputStream(FileOutputStream(f))
        var bytesWritten = 0
        var b: Int
        while (inputStream.read().also { b = it } != -1) {
            bos.write(b)
            bytesWritten++
        }
        bos.close()
        return bytesWritten
    }
    /**
     * For testing:
     * args[0] = Name of binary file to make a copy of.
     */
    /*
    public static void main(String[] args) throws Exception {
        //
        // Read file
        //
        MyFileReader mfr = new MyFileReader();
        //String fileName = args[0];
        String fileName = "D:\\MSCS\\OS\\OS_PROJECT\\Server_Memory\\test1.txt";
        byte[] fileData = mfr.readFile(fileName);
        //
        // Write copy of file
        //
        String[] parts = fileName.split("\\.");
        InputStream is = new ByteArrayInputStream(fileData);
        System.out.println(parts[0]);
        System.out.println(fileName);

        new MyFileWriter().writeFile(fileName + "_COPY." + parts[1], is);
    }*/
}