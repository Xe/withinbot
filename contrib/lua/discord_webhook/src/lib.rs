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
    use std::sync::Arc;

    smol::run(execute(url, Body::new(body)))
        .map_err(|why| mlua::Error::ExternalError(Arc::new(why)))?;

    Ok(())
}
