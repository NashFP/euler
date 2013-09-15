let rec fibo (array:int[]) max :int[] =
    let len = array.Length

    if len < 2 then fibo [|1;2;|] max
    elif array.[len-1] + array.[len-2] < max then fibo (Array.append array [|array.[len-1] + array.[len-2]|]) max
    else array 

fibo [||] 4000000 |> Array.filter (fun x -> x%2 = 0) |> Array.sum