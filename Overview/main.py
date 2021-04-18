import sys

# https://www.youtube.com/watch?v=prx1psByp7U&ab_channel=AbdulBari

class MatrixChainDecider:

    def __init__(self, size = 100):
        self.computation_storage = [[0 for x in range(size)] for y in range(size)]
        self.ordering_storage = [[0 for x in range(size)] for y in range(size)]
        self.input_matrix = []
        self.input_matrix_length = 0

    def insert_matrix(self, matrix):
        # matrix = [5, 4, 6, 2, 7] -> 5x4, 4x6, 6x2, 2x7
        self.input_matrix = matrix
        self.input_matrix_length = len(matrix) - 1

    def clear_storage(self):
        for x in range(self.input_matrix_length):
            self.computation_storage[x][x] = 0
            self.ordering_storage[x][x] = 0

    def get_comp(self):
        print(self.computation_storage[0][self.input_matrix_length-1])  # max comp
        print(self.computation_storage[self.input_matrix_length - 1][:self.input_matrix_length])    # for reording

    def decider(self):
        temp = 1
        for x in reversed(range(self.input_matrix_length)):
            for i in range(x):  # iterating through diagonally
                j = i + temp
                cost = sys.maxsize
                for k in range(i, j): # min { M[i,k] + M[k+1, j] + p(i-1)*p(k)*p(j) }
                    first = self.computation_storage[i][k]
                    sec = self.computation_storage[k+1][j]
                    last = self.input_matrix[i]*self.input_matrix[k+1]*self.input_matrix[j+1]
                    if first+sec+last < cost:
                        if i == 0 and j > 0:
                            self.computation_storage[self.input_matrix_length-1][self.input_matrix_length-1-j] = k+1
                        cost = first+sec+last
                self.computation_storage[i][j] = cost
            temp += 1

myMatrix = MatrixChainDecider(40)

myMatrix.insert_matrix([10, 25, 15, 60, 30])
myMatrix.clear_storage()
myMatrix.decider()
myMatrix.get_comp()

myMatrix.insert_matrix([5, 4, 6, 2, 7])
myMatrix.clear_storage()
myMatrix.decider()
myMatrix.get_comp()
