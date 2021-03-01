//
//  Arithmetic.swift
//  DJLog
//
//  Created by 郝旭姗 on 2021/3/1.
//

import Foundation

class Arithmetic : NSObject {
    class func execute() {
        let arithmetic =  Arithmetic()
//        let nums = [-2,1,-3,4,-1,2,1,-5,4]
//        let maxNumsSum = arithmetic.maxSubArrayGreed(nums)
//        print("最大值:\(maxNumsSum)")
        let mulStr = arithmetic.multiply("123", "45")
        print("字符串乘积: \(mulStr)")
        arithmetic.stringToArray("123")
//        let digits = "123".map{Int(String($0))!}

    }
}

//MARK: 最大子字符串
extension Arithmetic {
    //动态规划
    func maxSubArrayDynamic(_ nums: [Int]) -> Int {
        var sumNums = nums
        for i in 1..<sumNums.count {
            if sumNums[i-1] > 0 {
                sumNums[i] += sumNums[i-1]
            }
        }
        print(sumNums)
        return sumNums.max() ?? 0
    }
    
    //贪心算法
    func maxSubArrayGreed(_ nums: [Int]) -> Int {
        var sum = 0
        var result = nums[0]
        for i in 0..<nums.count {
            if sum > 0 {
                sum += nums[i]
            }else {
                sum = nums[i]
            }
            result = max(sum, result)
        }
        return result
    }
}


//MARK: 字符串相乘
extension Arithmetic {
    func multiply(_ num1: String, _ num2: String) -> String {
        print(num1)
        print(num2)
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        let arr1 = num1.compactMap { Int(String($0)) }
        let arr2 = num2.compactMap { Int(String($0)) }
        
        var res = [Int](repeating: 0, count: arr1.count + arr2.count)
        for i in (0..<arr1.count).reversed() {
            for j in (0..<arr2.count).reversed() {
                var mul = arr1[i] * arr2[j]
                print("\(arr1[i]) * \(arr2[j]) = \(mul)")
                print("res: \(res)")
                mul += res[i+j+1]
                print("后位: \(res[i+j+1]) mul: \(mul)")
                res[i+j] += mul / 10 //这次的高位需要加上次的高位
                res[i+j+1] = mul % 10 //低位一直在往前走,所以不用加上次的值
                print("res: \(res)\n")
                /*
                 int p1 = i + j, p2 = i + j + 1;
                // 叠加到 res 上
                int sum = mul + res[p2];
                res[i + j + 1] = sum % 10;
                res[i + j] += sum / 10;

                作者：labuladong
                链接：https://leetcode-cn.com/problems/multiply-strings/solution/gao-pin-mian-shi-xi-lie-zi-fu-chuan-cheng-fa-by-la/
                来源：力扣（LeetCode）
                著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
                 */
            }
            print(res)
        }
        
        var str = ""
        var i = res[0] > 0 ? 0 : 1
        for _ in i..<res.count {
            str += String(res[i])
            i += 1
        }
        return str
    }
    
    func stringToArray(_ str : String) -> [Int] {
        let characterArray = Array(str)
        var integerArray = [Int]()
        for character in characterArray {
            let unitScalar = character.unicodeScalars.first!.value - Unicode.Scalar("0").value
            integerArray.append(Int(unitScalar))
        }
        return integerArray
    }

}


//MARK: 栈实现队列

//MARK: 快排

