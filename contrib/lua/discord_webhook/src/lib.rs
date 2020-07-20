#[macro_use]
extern crate mlua_derive;
use mlua::prelude::*;

#[lua_module]
fn discord_webhook(lua: &Lua) -> LuaResult<LuaTable> {
    let exports = lua.create_table()?;
    exports.set("send", lua.create_async_function(send)?)?;
    Ok(exports)
}

async fn send(_: &Lua, (url, body): (String, String)) -> LuaResult<()> {
    use discord_webhook::*;
    smol::run(execute(url, Body::new(body))).expect("discord webhook post to work");

    Ok(())
}
