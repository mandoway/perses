

class TargetType11 {
    interface Predicate<X> {
        boolean apply(X c);
    }

    static class Test {
        public <T> Predicate<T> and(Predicate<? super T>... first) { return null; }
        public Predicate<Character> forPredicate(Predicate<? super Character> predicate) { return null; }

        Predicate<Character> c2 = forPredicate(c -> c.compareTo('e') < 0);
        Predicate<Integer> k = and(i -> i > 0, i -> i % 2 == 0);
    }
}
