list1 = input("Enter space-separated elements for List 1: ").split()
list2 = input("Enter space-separated elements for List 2: ").split()

print("\nList 1:", list1)
print("List 2:", list2)

item_to_append = input("\nEnter an element to append to List 1: ")
list1.append(item_to_append)
print("List 1 after append:", list1)

try:
    idx = int(input("\nEnter index to insert element into List 1: "))
    val = input("Enter value to insert: ")
    list1.insert(idx, val)
    print("List 1 after insert:", list1)
except ValueError:
    print("Error: Index must be an integer.")

try:
    item_to_remove = input("\nEnter an element to remove from List 1: ")
    list1.remove(item_to_remove)
    print("List 1 after remove:", list1)
except ValueError:
    print(f"Error: '{item_to_remove}' is not present in List 1.")

try:
    pop_idx = int(input("\nEnter index to pop an element from List 1: "))
    popped_item = list1.pop(pop_idx)
    print(f"Popped item '{popped_item}'. Updated List 1:", list1)
except IndexError:
    print("Error: Index out of range.")

merged_list = list1 + list2
print("\nMerged List (List 1 + List 2):", merged_list)
