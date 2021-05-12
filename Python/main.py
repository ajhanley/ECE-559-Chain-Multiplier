import sys

# https://www.youtube.com/watch?v=prx1psByp7U&ab_channel=AbdulBari

class MatrixChainDecider:

    def __init__(self, size = 32):
        self.computation_storage = [[0 for x in range(size)] for y in range(size)]
        self.input_matrix = []
        self.input_matrix_length = 0


    def insert_matrix(self, matrix):
        # max len of matrix = len(matrix) - 1 -> [256] * 33
        self.input_matrix = matrix
        self.input_matrix_length = len(matrix) - 1

    def clear_storage(self):
        for x in range(self.input_matrix_length):
            self.computation_storage[x][x] = 0

    def get_comp(self):
        print(self.input_matrix_length)
        print("\n Input: ",self.input_matrix, "\n Length of Input: ",len(self.input_matrix), "\n")
        for row in self.computation_storage:
            frmt = "{:>14}" * len(row)

            print(frmt.format(*row))
        return self.computation_storage[0][self.input_matrix_length-1]  # max comp
        # print(self.computation_storage[self.input_matrix_length - 1][:self.input_matrix_length])    # for reording

    def decider(self):
        for x in reversed(range(self.input_matrix_length)):
            for i in range(x):  # iterating through diagonally
                j = i + self.input_matrix_length - x
                cost = sys.maxsize
                for k in range(i, j): # min { M[i,k] + M[k+1, j] + p(i-1)*p(k)*p(j) }
                    first = self.computation_storage[i][k]
                    sec = self.computation_storage[k+1][j]
                    last = self.input_matrix[i]*self.input_matrix[k+1]*self.input_matrix[j+1]
                    # print(x, i, j)
                    if first+sec+last < cost:
                        self.computation_storage[j][i] = k+1
                        cost = first+sec+last
                self.computation_storage[i][j] = cost

myMatrix = MatrixChainDecider(30)
# matrix = [10, 25, 15, 60, 30]
matrix = [255]*31
# matrix = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2]
myMatrix.insert_matrix(matrix)
myMatrix.clear_storage()
myMatrix.decider()
myMatrix.get_comp()
