const std = @import("std");
const expect = std.testing.expect;
const eql = std.mem.eql;

// Структура - один из базовых типов
// В отличии от C, полям структуры можно
// присваивать значение по умолчанию (сила 0 тут)
// структуры могут включать в себя функции
pub const User = struct {
    power: u64 = 0,
    name: []const u8,
    pub fn init(name: []const u8, power: u64) User {
        return User{
            .name = name,
            .power = power,
        };
    }
    fn say(self: User, allocator: std.mem.Allocator) ![]const u8 {
        return std.fmt.allocPrint(
            allocator,
            "i am {s}, my power: {d}",
            .{ self.name, self.power },
        );
    }
};

test "type check" {
    const serr = User{ .name = "serr" };
    try expect(@TypeOf(User) == type);
    try expect(@TypeOf(serr) == User);
}

test "say method check" {
    const allocator = std.heap.page_allocator;
    const serr = User{ .name = "serr" }; // serr - экземпляр структуры User
    const msg = try serr.say(allocator);
    defer allocator.free(msg);
    try expect(eql(u8, "i am serr, my power: 0", msg));
}

test "init method check" {
    const user = User.init("vasya", 100);
    try expect(eql(u8, "vasya", user.name));
    try expect(100 == user.power);
}
