#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cstring>
#include <cmath>
#include <algorithm>    // std::reverse

using namespace std;

string com[ 100000 ], line;
int i;
vector< string > V;
string sol = "";

int num( string A ) {
	int ret = 0, p = 1;
	for( int k = A.length()-1; k >= 0; --k )
		ret += ( A[ k ]-'0' )*p, p *= 10;
	return ret;
}

string binary( int x ) {
    string b = "";
	while( x > 0 ) {
		if( x%2 )
			b = b+'1';
		else
			b = b+'0';
		x /= 2;
	}
	reverse( b.begin(), b.end() );
	return b;
}

string pretty( string A ) {
	string ret = "";
	int k = 0;
	bool ok = false;
	while( A[ k ] == ' ' ) ++k;
	for( k; k < A.length(); ++k ) {
		if( A[ k ] != ' ' ) {
				if( ok ) ret = ret+" ";
				ok = false;
				ret = ret+A[ k ];
			}
		else
			ok = true;
	}
	return ret;
}

int main( void ) {
    ifstream file( "A.txt" );
    if( file.is_open() ) {
        while( !file.eof() ) {
            getline( file,line );
            com[ i ] = line;
            ++i;
        }
    }
    file.close();
    ofstream outputFile("machine.txt");
	cout << "Your program has transferred to machine code.\n";
    for( i = 0; com[ i ] != "\0"; ++i ) {
        com[ i ] = pretty( com[ i ] );
        outputFile << '"';
		V.clear();
		string s = "";
		for( int j = 0; j < com[ i ].length(); ++j )
			if( com[ i ][ j ] == ' ' ) {
				V.push_back( s );
				s = "";
			} else s = s+com[ i ][ j ];
		if( !s.empty() )
			V.push_back( s );

		if( V[ 0 ] == "LOAD" ) {
			sol = "00001";
			int a = num( V[ 1 ] ); // second number
			string B = binary( a ), z = "";
			for( int k = 0; k < 8-B.length(); ++k )
				z = z+"0";
			sol = sol+z+binary( a );
			string t = "";
			z = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "NOP" )
			outputFile << "0000000000000000";
		if( V[ 0 ] == "STORE" ) {
			sol = "00010";
			int a = num( V[ 1 ] ); // second number
			string B = binary( a ), z = "";
			for( int k = 0; k < 8-B.length(); ++k )
				z = z+"0";
			sol = sol+z+binary( a );
			string t = "";
			z = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "MOV" ) {
			sol = "00011";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "JMP" ) {
			string B = binary( num( V[ 1 ] ) ), z = "";
			for( int k = 0; k < 11-B.length(); ++k )
				z = z+"0";
			outputFile << "00101"+z+B;
		}
		if( V[ 0 ] == "JMPI" ) {
			string B = binary( num( V[ 1 ] ) ), z = "";
			for( int k = 0; k < 11-B.length(); ++k )
				z = z+"0";
			outputFile << "00110"+z+B;
		}
		if( V[ 0 ] == "INC" ) {
			string B = V[ 1 ], z = "", B2 = "";
			for( int k = 1; k < B.length(); ++k ) B2 = B2+B[ k ];
			B2 = binary( num( B2 ) );
			for( int k = 0; k < 11-B2.length(); ++k )
				z = z+"0";
			outputFile << "00111"+z+B2;
		}
		if( V[ 0 ] == "DEC" ) {
			string B = V[ 1 ], z = "", B2 = "";
			for( int k = 1; k < B.length(); ++k ) B2 = B2+B[ k ];
			B2 = binary( num( B2 ) );
			for( int k = 0; k < 11-B2.length(); ++k )
				z = z+"0";
			outputFile << "01000"+z+B2;
		}
		if( V[ 0 ] == "AND" ) {
			sol = "01001";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "OR" ) {
			sol = "01010";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "XOR" ) {
			sol = "01011";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "NOT" ) {
			sol = "01100";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "ADD" ) {
			sol = "01101";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "SUB" ) {
			sol = "01110";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "SHL" ) {
			string B = V[ 1 ], z = "", B2 = "";
			for( int k = 1; k < B.length(); ++k ) B2 = B2+B[ k ];
			B2 = binary( num( B2 ) );
			for( int k = 0; k < 11-B2.length(); ++k )
				z = z+"0";
			outputFile << "10000"+z+B2;
		}
		if( V[ 0 ] == "SHR" ) {
			string B = V[ 1 ], z = "", B2 = "";
			for( int k = 1; k < B.length(); ++k ) B2 = B2+B[ k ];
			B2 = binary( num( B2 ) );
			for( int k = 0; k < 11-B2.length(); ++k )
				z = z+"0";
			outputFile << "10001"+z+B2;
		}
		if( V[ 0 ] == "ROTR" ) {
			string B = V[ 1 ], z = "", B2 = "";
			for( int k = 1; k < B.length(); ++k ) B2 = B2+B[ k ];
			B2 = binary( num( B2 ) );
			for( int k = 0; k < 11-B2.length(); ++k )
				z = z+"0";
			outputFile << "10010"+z+B2;
		}
		if( V[ 0 ] == "ROTL" ) {
			string B = V[ 1 ], z = "", B2 = "";
			for( int k = 1; k < B.length(); ++k ) B2 = B2+B[ k ];
			B2 = binary( num( B2 ) );
			for( int k = 0; k < 11-B2.length(); ++k )
				z = z+"0";
			outputFile << "10011"+z+B2;
		}
		if( V[ 0 ] == "ZERO" ) {
			string B = V[ 1 ], z = "", B2 = "";
			for( int k = 1; k < B.length(); ++k ) B2 = B2+B[ k ];
			B2 = binary( num( B2 ) );
			for( int k = 0; k < 11-B2.length(); ++k )
				z = z+"0";
			outputFile << "01111"+z+B2;
		}
		if( V[ 0 ] == "MUL" ) {
			sol = "10100";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "DIV" ) {
			sol = "10101";
			string t = "", B = "", z = "";
			for( int k = 1; k < V[ 1 ].length(); ++k ) t = t+V[ 1 ][ k ];
			for( int k = 0; k < 8-binary( num( t ) ).length(); ++k )
				z = z+"0";
			B = z+binary( num( t ) );
			t = "";
			for( int k = 1; k < V[ 2 ].length(); ++k ) t = t+V[ 2 ][ k ];
			z = "";
			for( int k = 0; k < 3-binary( num( t ) ).length(); ++k )
				z = z+"0";
			sol = sol+B+z+binary( num( t ) );
			outputFile << sol;
		}
		if( V[ 0 ] == "END" ) {
			outputFile << "1011000000000000";
		}
        outputFile << "\", -- " << i << ' ' << com[ i ] << endl;
	}
    outputFile.close();
    return 0;
}
