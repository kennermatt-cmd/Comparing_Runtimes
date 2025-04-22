import sys
import time
import matplotlib.pyplot as plt
import os


def timeEfficiency(func, *args, **kwargs):
    s_time = time.perf_counter()
    result = func(*args, **kwargs)
    e_time = time.perf_counter()
    return e_time - s_time

def load_data(filename):
    with open(filename) as f:
        lines = f.readlines()
    A = []
    for line in lines:
        numbers = map(int, line.split())
        A.extend(numbers)
    return A

def insertionSort(A):
    count = 0
    for j in range(1, len(A)):
        key = A[j]
        i = j - 1
        while i >= 0 and A[i] > key:
            A[i + 1] = A[i]
            i -= 1
            count += 1
        A[i + 1] = key
    print(f"[Insertion Sort] Comparisons: {count}")

def mergeSort(A):
    def mergeSortHelper(alist, count):
        if len(alist) > 1:
            mid = len(alist) // 2
            lefthalf = alist[:mid]
            righthalf = alist[mid:]
            count = mergeSortHelper(lefthalf, count)
            count = mergeSortHelper(righthalf, count)
            i = j = k = 0
            while i < len(lefthalf) and j < len(righthalf):
                if lefthalf[i] <= righthalf[j]:
                    alist[k] = lefthalf[i]
                    i += 1
                else:
                    alist[k] = righthalf[j]
                    j += 1
                k += 1
                count += 1
            while i < len(lefthalf):
                alist[k] = lefthalf[i]
                i += 1
                k += 1
            while j < len(righthalf):
                alist[k] = righthalf[j]
                j += 1
                k += 1
        return count
    total = mergeSortHelper(A, 0)
    print(f"[Merge Sort] Comparisons: {total}")

def run_benchmark(env_name="generic"):
    merge_file = "data/input/rand1000000.txt"
    insertion_file = "data/input/rand1000.txt"

    os.makedirs("data/charts", exist_ok=True)

    merge_data = load_data(merge_file)
    print(f"Running Merge Sort on {merge_file}...")
    merge_time = timeEfficiency(mergeSort, merge_data)

    insertion_data = load_data(insertion_file)
    print(f"Running Insertion Sort on {insertion_file}...")
    insertion_time = timeEfficiency(insertionSort, insertion_data)

    # Chart output filename
    chart_path = f"data/charts/sort_comparison_{env_name}.png"
    plt.bar(["Insertion (1K)", "Merge (1M)"], [insertion_time, merge_time])
    plt.ylabel("Time (seconds)")
    plt.title(f"Sort Benchmark ({env_name.capitalize()})")
    plt.tight_layout()
    plt.savefig(chart_path)
    plt.show()

    print(f"Chart saved to: {chart_path}")

if __name__ == "__main__":
    env = sys.argv[1] if len(sys.argv) > 1 else "generic"
    run_benchmark(env)