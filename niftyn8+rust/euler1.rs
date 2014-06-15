fn sum_multiples(num: int) -> int {
    fn add_if_multiple(num: int, acc: int) -> int {
        match num {
            0 => acc,
            _ => if num % 3 == 0 || num % 5 == 0 {
                add_if_multiple(num - 1, acc + num)
            } else {
                add_if_multiple(num - 1, acc)
            }
        }
    }
    add_if_multiple(num, 0)
}

fn main() {
    let total = sum_multiples(1000);
    println!("The total is: {}", total);
}
