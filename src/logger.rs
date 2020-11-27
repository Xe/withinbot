use log::{
    Level::{Debug, Trace},
    Log, Metadata, Record, SetLoggerError,
};
use systemd::journal::log_record;

pub struct JournalLog;

impl Log for JournalLog {
    fn enabled(&self, metadata: &Metadata<'_>) -> bool {
        if metadata.level() == Debug || metadata.level() == Trace {
            false
        } else {
            match metadata.target() {
                "serenity::client::bridge::gateway::shard_runner" | "serenity::gateway::shard" => {
                    false
                }
                _ => true,
            }
        }
    }

    fn log(&self, record: &Record<'_>) {
        if !self.enabled(record.metadata()) {
            return;
        }

        log_record(record);
    }

    fn flush(&self) {}
}

impl JournalLog {
    pub fn init() -> Result<(), SetLoggerError> {
        log::set_logger(&JournalLog {})
    }
}
