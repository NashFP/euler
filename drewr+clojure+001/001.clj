(ns com.draines.euler.001)

(defn mul? [n m]
  (= 0 (rem n m)))

(defn any-divisible? [n divs]
  (reduce #(or %1 (mul? n %2)) false divs))

(defn sum-multiples [n & divisors]
  (let [sum-if (fn [sum x]
                 (if (any-divisible? x divisors)
                   (+ sum x)
                   sum))]
    (reduce sum-if (range n))))

(sum-multiples 1000 5 3)
