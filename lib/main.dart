import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController searchController = TextEditingController();
  List<String> members = List<String>.generate(10, (index) => 'Yashika');
  List<String> filteredMembers = [];

  bool showSearchBar = false;

  @override
  void initState() {
    super.initState();
    filteredMembers = members;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _toggleSearchBarVisibility() {
    setState(() {
      showSearchBar = !showSearchBar;
    });
  }

  void _searchMembers(String query) {
    setState(() {
      filteredMembers = members
          .where((member) => member.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://img4.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202107/15/mydaily/20210715133502249nlwc.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ..... Read more",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  _buildTag("Outdoor"),
                  SizedBox(width: 8),
                  _buildTag("Outdoor"),
                  SizedBox(width: 8),
                  _buildTag("Outdoor"),
                  SizedBox(width: 8),
                  _buildTag("Outdoor"),
                  SizedBox(width: 8),
                  _buildTag("Outdoor"),
                  SizedBox(width: 8),
                  _buildTag("+1"),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Media, docs, and links",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  ImageWidget(),
                  SizedBox(width: 8),
                  ImageWidget(),
                  SizedBox(width: 8),
                  ImageWidget(),
                  SizedBox(width: 8),
                  ImageWidget(),
                  SizedBox(width: 8),
                  ImageWidget(),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Mute notification",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.toggle_off_rounded,
                      color: Colors.grey,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Clear chat",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.enhanced_encryption,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Encryption",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app_sharp,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Exit community",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Report",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: _toggleSearchBarVisibility,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  children: [
                    
                    Text(
                      "Members",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.search),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          if (showSearchBar)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: searchController,
                  onChanged: _searchMembers,
                  decoration: InputDecoration(
                    labelText: 'Search Members',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListItem(name: filteredMembers[index]),
              childCount: filteredMembers.length,
            ),
          ),
        ],
      ),
    );
  }
}

  Widget _buildTag(String text) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 20,
      child: Text(
        text,
        style: TextStyle(color: Colors.red),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.red),
      ),
    );
  }


class ListItem extends StatefulWidget {
  final String name;
  const ListItem({required this.name, Key? key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isFollowing = false;

  void _toggleFollowing() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://th.bing.com/th/id/OIP.qCwzcwt2fPyY_mtzTjXm-AHaFj?w=4070&h=3052&rs=1&pid=ImgDetMain"),
      ),
      title: Text(widget.name),
      subtitle: Text("29, India"),
      trailing: GestureDetector(
        onTap: _toggleFollowing,
        child: Container(
          height: 30,
          width: 105,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isFollowing ? Colors.grey : const Color.fromARGB(255, 230, 59, 116),
            borderRadius: BorderRadius.circular(20),
          ),
          
             child:  Center(
               child: Text(
                  isFollowing ? 'Following' : 'Add',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),
                ),
             ),
            
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://img4.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202107/15/mydaily/20210715133502249nlwc.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  _SliverAppBarDelegate({
    this.minHeight = 80,
    this.maxHeight = 80,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    bool isScrolled = shrinkOffset > 50;
    return Container(
      color: const Color.fromARGB(255, 236, 47, 33),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            if (isScrolled)
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  "https://img4.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202107/15/mydaily/20210715133502249nlwc.jpg",
                ),
              ),
            if (isScrolled) SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "The Weeknd",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Community = +11k Members",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(),
            if (isScrolled)
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {
                  _showBottomSheet(context);
                },
              ),
            if (!isScrolled)
              Card(
                color: Colors.red,
                child: IconButton(
                  icon: const Icon(Icons.share_outlined, color: Colors.white),
                  onPressed: () {},
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.link),
                  title: Text('Invite',style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle invite action
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text('Add Member',style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle add member action
                  },
                ),
                
                ListTile(
                  leading: Icon(Icons.group_add),
                  title: Text('Add Group',style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle add group action
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight;
  }
}
