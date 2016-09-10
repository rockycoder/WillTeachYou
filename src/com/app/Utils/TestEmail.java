package com.app.Utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.NoSuchElementException;
import java.util.Scanner;



public class TestEmail
{
    public static void main( String[] args ) throws NoSuchElementException, FileNotFoundException
    {

        Scanner scan = new Scanner( new File( "E:/test.txt" ));
        
        scan.useDelimiter( "\n" );
        
        while(scan.hasNext())
        {
            System.out.println( scan.next() );
        }


    }
}