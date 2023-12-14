import 'dart:io';

bool flag = true;
void main() {
  List<List<String>> matrix = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9']
  ];

  printMatrix(matrix);
  while (flag) {
    if (player1Turn(matrix) == true) {
      print('*Player1 WIN*');
      flag = false;
      break;
    } else if (!flag) {
      break;
    }

    if (player2Turn(matrix) == true) {
      print('*Player2 WIN*');
      flag = false;
      break;
    } else if (!flag) {
      break;
    }
  }
}

printMatrix(List matrix) {
  for (int i = 0; i < matrix.length; i++) {
    printRow(matrix[i]);
    if (i != matrix.length - 1) print('---+---+---');
  }
}

void printRow(List row) {
  print(' ${row[0]} | ${row[1]} | ${row[2]} ');
}

bool player1Turn(List matrix) {
  int player1 = 0, row, col;
  print(
      'player 1, please enter the number of the square where you want to place your X:');
  player1 = int.parse(stdin.readLineSync()!);
  if (player1 > 9 || player1 < 1) {
    print('--invalid input--');
    return (player1Turn(matrix));
  }
  row = ((player1 - 1) ~/ 3);
  col = (player1 - 1) % 3;
  if (matrix[row][col] != 'O' && matrix[row][col] != 'X') {
    matrix[row][col] = 'X';
    printMatrix(matrix);
    if(checkMatrix(matrix)){
      return(true);
    }else{
      if(IsItFull(matrix)){
        print('GAME OVER');
        flag=false;
        return false;
      }
      return false;
    }
  }else{
    return(player1Turn(matrix));
  }
}

bool player2Turn(List matrix) {
  int player2 = 0, row, col;
  print(
      'player 2, please enter the number of the square where you want to place your O:');
  player2 = int.parse(stdin.readLineSync()!);
  if (player2 > 9 || player2 < 1) {
    print('--invalid input--');
    return (player2Turn(matrix));
  }
  row = ((player2 - 1) ~/ 3);
  col = (player2 - 1) % 3;
  if (matrix[row][col] != 'O' && matrix[row][col] != 'X') {
    matrix[row][col] = 'O';
    printMatrix(matrix);
    if(checkMatrix(matrix)){
      return(true);
    }else{
      if(IsItFull(matrix)){
        print('GAME OVER');
        flag=false;
        return false;
      }
      return false;
    }
  }else{
    return(player2Turn(matrix));
  }
}

bool checkMatrix(List matrix) {
  //check rows & columns

  for (int i = 0; i < matrix.length; i++) {
    if (matrix[i][0] == matrix[i][1] && matrix[i][1] == matrix[i][2]) {
      return true;
    } else if (matrix[0][i] == matrix[1][i] && matrix[1][i] == matrix[2][i]) {
      return true;
    }
  }
  //check digonals
  if (matrix[0][0] == matrix[1][1] && matrix[1][1] == matrix[2][2] ||
      matrix[2][0] == matrix[1][1] && matrix[1][1] == matrix[0][2]) {
    return true;
  }
  return false;
}

bool IsItFull(List matrix) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (matrix[i][j] != 'O' && matrix[i][j] != 'X') {
        return false;
      }
    }
  }
  return true;
}