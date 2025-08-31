

pub fn main() void {
    {
        // const arr = [_]u8{1,2,3,4,5};
        // arr[0] += 1; // error: cannot assign to constant
    }
    {
        // var arr = [_] const u8{1,2,3,4,5}; // error: pointer modifier 'const' not allowed on array child type
        // arr[0] += 1;
    }
}
