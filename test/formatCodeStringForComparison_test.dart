//create tests for formatCodeStringForComparison
import 'package:adi_helpers/formatCodeStringForComparison.dart';
import 'package:test/test.dart';

void main() {
  test('Removes empty lines and trims each line', () {
    String input = '''
      
      This is a 
      multi-line
      string
      
      
      with some spaces
      

      ''';

    String expectedOutput = """This is a
multi-line
string
with some spaces""";
    expect(formatCodeStringForComparison(input), equals(expectedOutput));
  });

  test('Handles input with no empty lines', () {
    String input = """This
is
a
single
line
string""";
    expect(formatCodeStringForComparison(input), equals(input));
  });

  test('Handles input with only whitespace lines', () {
    String input = '''
    
    
    \t   
        
    \n\n\n\n
    
    ''';
    expect(formatCodeStringForComparison(input), equals(''));
  });

  test('Handles input with leading and trailing whitespace', () {
    String input = '\n\n    Trim   \n  spaces  \n\n\n';
    expect(formatCodeStringForComparison(input), equals('Trim\nspaces'));
  });
}
