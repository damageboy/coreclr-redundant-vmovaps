using System;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using static System.Runtime.Intrinsics.X86.Avx;
using static System.Runtime.Intrinsics.X86.Avx2;
using static System.Runtime.Intrinsics.X86.Popcnt.X64;


namespace superfluous_mov
{
    class Program
    {
        static unsafe void Main(string[] args)
        {
            BugBugBug();
        }

        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        unsafe static void BugBugBug()
        {
            var N = Vector256<int>.Count;
            var P = Vector256.Create(100);

            var e0 = P.GetElement(0);
            var e1 = P.GetElement(1);
            var e2 = P.GetElement(2);
            var e3 = P.GetElement(3);


            Console.WriteLine($"{e0+e1+e2+e3}");
            Console.ReadLine();

        }
    }
}
