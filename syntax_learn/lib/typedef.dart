typedef Compare = int Function(Object a, Object b);

class SortedCollection {
  Compare compare;

  SortedCollection(this.compare);
}

// Initial, broken implementation.
int sort(Object a, Object b) => 0;

typedef Compare1<T> = int Function(T a, T b);

int sort1(int a, int b) => a - b;

void main() {
}

void testTypedef() {
  SortedCollection coll = SortedCollection(sort);
  assert(coll.compare is Function);
  assert(coll.compare is Compare);
  assert(sort is Compare1<int>); // True!
}