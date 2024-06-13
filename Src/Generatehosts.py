

def write_numbers_to_file(numbers, filename):
    with open(filename, 'w') as file:
        for i in range(numbers):
            file.write(str(" host" + str(i+1) ))

if __name__ == "__main__":
    output_filename = "C:\\shubham\\GitHubRepo\\GreedyAODV\\Src\\generatehosts.txt"


    write_numbers_to_file(96, output_filename)



