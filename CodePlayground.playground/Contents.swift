import Cocoa


// 递归
func f2(_ n: Int) -> Int {
    if n == 1 {
        return 1
    } else {
        return n + f2(n - 1)
    }
}
// 尾递归
func f3(_ n: Int, _ total: Int = 0) -> Int {
    if n == 1 {
        return total + 1
    } else {
        return f3(n, total)
    }
}

// 斐波拉切数列
func f4(_ n: Int) -> Int {
    if n <= 2 {
        return 1
    } else {
        return f4(n - 1) + f4(n - 2)
    }
}

f2(5)
//f3(5)
f4(3)
