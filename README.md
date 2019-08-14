 iTunes Search and Favorites App

Part 1
- Create a UITableView that displays a list of your top 15 favorite songs.
    - Each cell should display (at least) the artist, album, track name, genre, and track length.
- The song data can be hard-coded.
- Use a mixture of different artists, albums, and genres.
- The interface should be able to rotate.

Part 2
- Allow the user to swipe a cell to mark an item as a favorite or to unfavorite an item.
    - There should be some sort of indication that a cell is favorited.
- As of now there should have been a single view (a UITableView). Add a UITabBar with 2 tabs. The first tab should contain the original table view. The second tab should contain a new table view with the list of favorites. The interface and features should be the same as the first tab. 
    - If a user unfavorites an item from the favorites tab it should be removed from the table view.
- Favorites do not need to be persisted if the user quits the app.

Part 3
- Add a search bar that allows the user to filter the results.
    - The filter should apply to the artist, album, track name, and genre.
    
Part 4
- Add a UISegmentedControl with the following segments: All, Artist, Album, Genre.
    - By default 'All' should be selected.
    - Selecting 'Artist', 'Album', or 'Genre' should display a single cell for each unique grouping. For example, selecting 'Genre' could have cells labeled 'Reggae', 'Hip-Hop', and 'Jazz'.
        - Selecting a cell should push a new UIViewController with a UITableView containing all items for that category using a UINavigationController.

Part 5
- The app will fetch data from the iTunes API. 

Part 6
- When a user force-quits the app and later re-launches it, the favorited items should still be persisted.
