#[test]
fn test_init() {
    native::api::init("target/tests_data".to_owned());
}

#[test]
fn test_rank() {
    test_init();
    let response = native::api::rank("day".to_string(), 0, 21).unwrap();
    println!("{:?}", serde_json::to_string(&response).unwrap());
}
#[test]
fn test_comic() {
    test_init();
    let response = native::api::comic("zhinaiyulian".to_string()).unwrap();
    println!("{:?}", serde_json::to_string(&response).unwrap());
}

#[tokio::test]
async fn test_client() {}
