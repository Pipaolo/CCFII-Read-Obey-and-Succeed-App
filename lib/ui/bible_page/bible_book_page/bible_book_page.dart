import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:ccfii_read_obey_succeed/data/model/bible_book.dart';
import 'package:ccfii_read_obey_succeed/data/repository/bible_repository.dart';
import 'package:ccfii_read_obey_succeed/routes/router.gr.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bloc/bible_book/bible_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

class BibleBookPage extends StatelessWidget implements AutoRouteWrapper {
  final String bookId;
  const BibleBookPage({
    Key key,
    this.bookId,
  }) : super(key: key);

  @override
  Widget get wrappedRoute => BlocProvider<BibleBookBloc>(
      create: (context) =>
          BibleBookBloc(bibleRepository: context.repository<BibleRepository>())
            ..add(
              BibleBookPressed(
                bookId: bookId,
              ),
            ),
      child: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BibleBookBloc, BibleBookState>(
        builder: (context, state) {
          if (state is BibleBookLoading) {
            return _buildLoading();
          } else if (state is BibleBookSuccess) {
            return _buildSuccess(state.bibleBook);
          } else if (state is BibleBookError) {
            return _buildError();
          }
          return Container();
        },
      ),
    );
  }

  _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildSuccess(BibleBook book) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(
            book.title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(60),
            ),
          ),
          pinned: true,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: book.numberOfChapters,
              itemBuilder: (context, i) {
                final chapter = book.chapters[i];
                return Card(
                  color: ccfiiLightOrange,
                  child: InkWell(
                    onTap: () => ExtendedNavigator.of(context).pushNamed(
                      Routes.bibleReaderPageRoute,
                      arguments: BibleReaderPageArguments(
                        chapter: chapter,
                        bookTitle: book.title,
                      ),
                    ),
                    child: Center(
                      child: Text(chapter.number.toString()),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  _buildError() {
    return Center(
      child: Text('Something bad happened!'),
    );
  }
}