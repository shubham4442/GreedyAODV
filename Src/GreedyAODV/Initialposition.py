import random
import matplotlib.pyplot as plt

def generate_random_numbers(num_lines, min_value, max_value):
    return [random.randint(min_value, max_value) for _ in range(num_lines)]

def write_numbers_to_file(random_numbersX, random_numbersY, filename):
    with open(filename, 'w') as file:
        for i in range(len(random_numbersX)):
            file.write(str( '\t\t'+ "host" + str(i+1) + ": AodvRouter {"+ '\n'))
            file.write(str( '\t\t\t'+ "@display(\"p=" + str(random_numbersX[i]) + "," + str(random_numbersY[i]) + "\");"+ '\n'))
            file.write(str('\t\t'+ "}"+ '\n'))

if __name__ == "__main__":
    output_filename = "C:\\shubham\\GitHubRepo\\GreedyAODV\\Src\\hostsIniPos.txt"

    random_numbersX = generate_random_numbers(num_lines = 24, min_value = 500, max_value = 2000)
    random_numbersY = generate_random_numbers(num_lines = 24, min_value = 500, max_value = 2000)
  

    random_numbersX.extend(generate_random_numbers(num_lines = 24, min_value = 2500, max_value = 4500))
    random_numbersY.extend(generate_random_numbers(num_lines = 24, min_value = 2500, max_value = 4000))
    
    random_numbersX.extend(generate_random_numbers(num_lines = 24, min_value = 5000, max_value = 7500))
    random_numbersY.extend(generate_random_numbers(num_lines = 24, min_value = 2500, max_value = 4000))

    random_numbersX.extend(generate_random_numbers(num_lines = 24, min_value = 8000, max_value = 10000))
    random_numbersY.extend(generate_random_numbers(num_lines = 24, min_value = 500, max_value = 2500))

    write_numbers_to_file(random_numbersX, random_numbersY, output_filename)

    plt.scatter(random_numbersX[:23], random_numbersY[:23])
    plt.scatter(random_numbersX[24:47], random_numbersY[24:47])
    plt.scatter(random_numbersX[48:71], random_numbersY[48:71])
    plt.scatter(random_numbersX[72:], random_numbersY[72:])
    plt.show()

