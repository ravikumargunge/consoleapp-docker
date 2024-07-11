using System.Diagnostics.Contracts;
using System.IO;
class Program
{
    static void Main(string[] args){
        string filepath= "example.txt";
        string texttToWrite= "Hello, this is a test file created by c# console app";
        File.WriteAllText(filepath, texttToWrite);

        Console.WriteLine($" File '{filepath}' created and text written successfully");

        string readText= File.ReadAllText(filepath);

        Console.WriteLine("Text read from the file");
        Console.WriteLine(readText);
    }
}