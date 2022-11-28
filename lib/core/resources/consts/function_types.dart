// ignore_for_file: prefer_function_declarations_over_variables

typedef DropdownTextClosure<T> = String Function(T v);
typedef OnChangedDropdownClosure<T> = void Function(T? v);
typedef DefaultEmptyClosure = void Function();
typedef DefaultEmptyClosureWithParam<T> = void Function(T v);
// typedef SelectorType<R,T> = R Function(T v);
// typedef

final DropdownTextClosure<String> giveStringValue = (String value) => value;
final DefaultEmptyClosureWithParam<String> giveEmptyStringClosure = (String v) {};
final DefaultEmptyClosureWithParam<int> giveEmptyIntegerClosure = (int v) {};
// SelectorType<R,T> something = R select<T, R>(R Function(T) selector);