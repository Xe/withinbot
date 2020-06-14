use criterion::{criterion_group, criterion_main, Criterion};

fn load_campaign() {
    let camp: six_e::types::Campaign = serde_dhall::from_file("../campaigns/Miau/package.dhall").parse().unwrap();
}

fn criterion_benchmark(c: &mut Criterion) {
    c.bench_function("loading campaign", |b| b.iter(|| load_campaign()));
}

criterion_group!(benches, criterion_benchmark);
criterion_main!(benches);
