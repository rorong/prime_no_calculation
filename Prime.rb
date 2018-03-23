class Prime

  def initialize
    puts "Prime number which is sum of consecutive Primes with maximum terms"
  end
  def solution
    prime_sum = 0
    max_prime_sums = 0
    prime_no_arr = []
    arr_index = 0
    terms = 0
    max_terms = 0
    i = 2
    while i < 1000000
      if is_prime(i)
        print "Prime No. = "
        puts i
        prime_no_arr[arr_index]=i
        terms=consecutive_sum(i,prime_no_arr,arr_index)
        if terms > max_terms
          max_terms=terms
          max_prime_sums = i
        end
        arr_index += 1
      end
      i += 1
    end
    puts "A Prime under one million which is sum of maximum numbers of consecutive primes is #{max_prime_sums} and No. of consecutive terms are #{max_terms}"
  end

  def is_prime(number)
    i = 2
    while i <= (number/2)
      if((number % i) == 0)
        break;
      end
      i += 1
    end
    if (i > (number/2))
      return true
    else
      return false
    end
  end

  def consecutive_sum(prime_sum, prime_no_arr,len)
    sum = 0
    terms = 0
    beg_index = 0
    beg_point = 0
    i = 0
    while (beg_point < len && prime_sum > prime_no_arr[beg_point])
      terms=0
      sum=0
      beg_index = beg_point
      while (beg_index < len && sum <= prime_sum)
        sum+=(prime_no_arr[beg_index]).to_i
        terms+=1
        if (sum==prime_sum)
          puts "#{prime_sum} is sum of #{terms} consecutive primes."
          i=beg_point
          while i< (beg_point+terms)
            print prime_no_arr[i]
            print " "
            i +=1
          end
          puts " "
          break
        end
        beg_index += 1
      end
      if sum==prime_sum
        break
      end
      beg_point += 1
    end
    return terms
  end
end

Prime.new.solution
