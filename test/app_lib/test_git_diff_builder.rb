    lines =
    [
      'diff --git a/sandbox/file with_space b/sandbox/file with_space',
      'new file mode 100644',
      'index 0000000..21984c7',
      '--- /dev/null',
      '+++ b/sandbox/file with_space',
      '@@ -0,0 +1 @@',
      '+Please rename me!',
      '\\ No newline at end of file'
    ].join("\n")
    source_lines =
    [
      'Please rename me!'
    ].join("\n")
      section(0),
      added_line('Please rename me!', 1),
    lines =
    [
      'diff --git a/sandbox/untitled_5G3 b/sandbox/untitled_5G3',
      'index e69de29..2e65efe 100644',
      '--- a/sandbox/untitled_5G3',
      '+++ b/sandbox/untitled_5G3',
      '@@ -0,0 +1 @@',
      '+aaa',
      '\\ No newline at end of file'
    ].join("\n")

    # http://www.artima.com/weblogs/viewpost.jsp?thread=164293
    # Is a blog entry by Guido van Rossum.
    # He says that in L,S the ,S can be omitted if the chunk size
    # S is 1. So -3 is the same as -3,1
                  :added_lines   => [ 'aaa' ],
    source_lines =
    [
      'aaa'
    ].join("\n")
      section(0),
      added_line('aaa', 1),
    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index b1a30d9..7fa9727 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -1,5 +1,5 @@',
      ' aaa',
      '-bbb',
      '+ccc',
      ' ddd',
      ' eee',
      ' fff',
      '@@ -8,6 +8,6 @@',
      ' nnn',
      ' ooo',
      ' ppp',
      '-qqq',
      '+rrr',
      ' sss',
      ' ttt',
      '\\ No newline at end of file'
    ].join("\n")
              :before_lines => [ 'aaa' ],
                  :deleted_lines => [ 'bbb' ],
                  :added_lines   => [ 'ccc' ],
                  :after_lines => [ 'ddd', 'eee', 'fff' ]
              :before_lines => [ 'nnn', 'ooo', 'ppp' ],
                  :deleted_lines => [ 'qqq' ],
                  :added_lines   => [ 'rrr' ],
                  :after_lines => [ 'sss', 'ttt' ]
    source_lines =
    [
      'aaa',
      'ccc',
      'ddd',
      'eee',
      'fff',
      'ggg',
      'hhh',
      'nnn',
      'ooo',
      'ppp',
      'rrr',
      'sss',
      'ttt'
    ].join("\n")
      same_line('aaa', 1),
      section(0),
      deleted_line('bbb', 2),
      added_line('ccc', 2),
      same_line('ddd',  3),
      same_line('eee',  4),
      same_line('fff',  5),
      same_line('ggg',  6),
      same_line('hhh',  7),
      same_line('nnn',  8),
      same_line('ooo',  9),
      same_line('ppp', 10),
      section(1),
      deleted_line('qqq', 11),
      added_line('rrr', 11),
      same_line('sss', 12),
      same_line('ttt', 13)
    # diffs need to be 7 lines apart not to be merged
    # into contiguous sections in one chunk

    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 0719398..2943489 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -1,4 +1,4 @@',
      '-aaa',
      '+bbb',
      ' ccc',
      ' ddd',
      ' eee',
      '@@ -6,4 +6,4 @@',
      ' ppp',
      ' qqq',
      ' rrr',
      '-sss',
      '+ttt'
    ].join("\n")
                  :deleted_lines => [ 'aaa' ],
                  :added_lines   => [ 'bbb' ],
                  :after_lines => [ 'ccc', 'ddd', 'eee' ]
              :before_lines => [ 'ppp', 'qqq', 'rrr' ],
                  :deleted_lines => [ 'sss' ],
                  :added_lines   => [ 'ttt' ],
    source_lines =
    [
      'bbb',
      'ccc',
      'ddd',
      'eee',
      'fff',
      'ppp',
      'qqq',
      'rrr',
      'ttt'
    ].join("\n")
      section(0),
      deleted_line('aaa', 1),
      added_line('bbb', 1),
      same_line('ccc', 2),
      same_line('ddd', 3),
      same_line('eee', 4),
      same_line('fff', 5),
      same_line('ppp', 6),
      same_line('qqq', 7),
      same_line('rrr', 8),
      section(1),
      deleted_line('sss', 9),
      added_line('ttt', 9)
    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 535d2b0..a173ef1 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -1,8 +1,8 @@',
      ' aaa',
      ' bbb',
      '-ccc',
      '+ddd',
      ' eee',
      '-fff',
      '+ggg',
      ' hhh',
      ' iii',
      ' jjj'
    ].join("\n")
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 535d2b0..a173ef1 100644'
              :before_lines => [ 'aaa', 'bbb' ],
                  :deleted_lines => [ 'ccc' ],
                  :added_lines   => [ 'ddd' ],
                  :after_lines => [ 'eee' ]
                  :deleted_lines => [ 'fff' ],
                  :added_lines   => [ 'ggg' ],
                  :after_lines => [ 'hhh', 'iii', 'jjj' ]
    source_lines =
    [
      'aaa',
      'bbb',
      'ddd',
      'eee',
      'ggg',
      'hhh',
      'iii',
      'jjj'
    ].join("\n")
      same_line('aaa', 1),
      same_line('bbb', 2),
      section(0),
      deleted_line('ccc', 3),
      added_line('ddd', 3),
      same_line('eee', 4),
      section(1),
      deleted_line('fff', 5),
      added_line('ggg', 5),
      same_line('hhh', 6),
      same_line('iii', 7),
      same_line('jjj', 8)
    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 06e567b..59e88aa 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -1,6 +1,9 @@',
      ' 1',
      ' 2',
      ' 3',
      '+3a1',
      '+3a2',
      '+3a3',
      ' 4',
      ' 5',
      ' 6'
    ].join("\n")
              :before_lines => [ '1', '2', '3' ],
                  :added_lines   => [ '3a1', '3a2', '3a3' ],
                  :after_lines => [ '4', '5', '6' ]
    source_lines =
    [
      '1',
      '2',
      '3',
      '3a1',
      '3a2',
      '3a3',
      '4',
      '5',
      '6',
      '7'
    ].join("\n")
      same_line('1', 1),
      same_line('2', 2),
      same_line('3', 3),
      section(0),
      added_line('3a1', 4),
      added_line('3a2', 5),
      added_line('3a3', 6),
      same_line('4', 7),
      same_line('5', 8),
      same_line('6', 9),
      same_line('7', 10)
              :before_lines => [ '3', '4', '5' ],
                  :deleted_lines => [ '6', '7', '8' ],
                  :added_lines   => [ '7a' ],
                  :after_lines => [ '9', '10', '11' ]
      same_line('1', 1),
      same_line('2', 2),
      same_line('3', 3),
      same_line('4', 4),
      same_line('5', 5),
      section(0),
      deleted_line('6', 6),
      deleted_line('7', 7),
      deleted_line('8', 8),
      added_line('7a', 6),
      same_line('9', 7),
      same_line('10', 8),
      same_line('11', 9),
      same_line('12', 10)