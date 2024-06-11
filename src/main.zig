const std = @import("std");

const mach = @import("mach");

pub const App = @This();

pub fn init(_: *App) !void {
    try mach.core.init(.{
        .title = "ShanHaiYou",
        .size = .{ .width = 960, .height = 640 },
    });
}

pub fn deinit(app: *App) void {
    _ = app;
    mach.core.deinit();
}

pub fn update(_: *App) !bool {
    var iter = mach.core.pollEvents();
    while (iter.next()) |e| if (e == .close) return true;

    return false;
}
