**Estimated time** - 4 hours

**Main Focus**: Bloc, local database, REST APIs usage (DIO), responsiveness

**What is that I have to build?**

You would be implementing an app, with two screens.
(Please refer to the next page for screen 1 and 2)

**What will my solution contain?**

- **Screen 1**

  - A video/picture/gif at the center of the screen with height which is half the user’s phone size and this comes from the API : https://random.dog/woof.json

  - While loading there should be a loading indicator at the center of the screen.

  - There must be error handling.

  - And when this picture is loaded and displayed, a Floating action button shows up (which was previously not there).

  - The floating action button does two things :
    Saves the image in localdb using [Hive](https://pub.dev/packages/hive) and navigates to a Screen 2.

- **Screen 2**

  - A list view with several posts as a ListTile in UI.

  - These posts will come from the API: http://jsonplaceholder.typicode.com/posts

  - While loading there should be a loading indicator at the center of the screen.

  - There must be error handling.

**NOTE:**

You would be using [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management.

You would be using [dio](https://pub.dev/packages/dio) for making API requests.

You would be using [hive](https://pub.dev/packages/hive) for saving data in the local db.

**Test Cases**:

You have to write test cases for both the blocs which you will make for screen 1 and 2 using [bloc_test](https://pub.dev/packages/bloc_test).
