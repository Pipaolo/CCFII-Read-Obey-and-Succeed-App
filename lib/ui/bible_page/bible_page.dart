import 'package:ccfii_read_obey_succeed/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/bible_directory.dart';
import 'bloc/bible_page/bible_page_bloc.dart';
import 'widgets/bible_listing.dart';

class BiblePage extends StatelessWidget {
  const BiblePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BiblePageBloc, BiblePageState>(
      builder: (context, state) {
        if (state is BiblePageLoading) {
          return _buildLoading();
        } else if (state is BiblePageSuccess) {
          return _buildSuccess(
              state.newTestamentDirectories, state.oldTestamentDirectories);
        } else if (state is BiblePageError) {
          return _buildError();
        }

        return Container();
      },
    );
  }

  _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildSuccess(List<BibleDirectory> ntDirectories, otDirectories) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomAppBar(),
          BibleListing(
            directories: otDirectories,
            title: 'Old Testament',
            isLeft: true,
          ),
          const SizedBox(
            height: 20,
          ),
          BibleListing(
            directories: ntDirectories,
            title: 'New Testament',
            isLeft: true,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _buildError() {
    return Center(
      child: Text('An error has occurred'),
    );
  }
}
