///Partial application to apply a parameter to a function
T3 Function(T2) p1<T1, T2, T3>(T1 a, T3 Function(T1 a, T2 b) f) {
  return (T2 b) => f(a, b);
}
