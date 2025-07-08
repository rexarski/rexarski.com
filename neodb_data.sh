# Fetch and process book data
curl -X 'GET' 'https://neodb.social/api/me/shelf/progress?category=book&page=1' \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $NEODB_BEARER_TOKEN" | \
    jq '{data: [.data[] | {id: .item.id, title: .item.title, created_time: .created_time}]}' > ./assets/data/book_in_progress.json

# Fetch and process TV data
curl -X 'GET' 'https://neodb.social/api/me/shelf/progress?category=tv&page=1' \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $NEODB_BEARER_TOKEN" | \
    jq '{data: [.data[] | {id: .item.id, title: .item.title, created_time: .created_time}]}' > ./assets/data/tv_in_progress.json

# Fetch and process game data
curl -X 'GET' 'https://neodb.social/api/me/shelf/progress?category=game&page=1' \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $NEODB_BEARER_TOKEN" | \
    jq '{data: [.data[] | {id: .item.id, title: .item.title, created_time: .created_time}]}' > ./assets/data/game_in_progress.json