/*
 * BSD 3-Clause License
 *
 * Copyright (c) 2021, Birju Vachhani
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// Author: Birju Vachhani
// Created Date: January 21, 2021

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

/// A widget that fades as deadline comes closer and hides completely
/// when the deadline is reached.
class NotPaid extends StatefulWidget {
  final Widget child;
  final DateTime dueDate;

  // In days
  final int deadline;
  final bool enabled;
  final bool showBanner;
  final Duration duration;
  final TextDirection directionality;

  const NotPaid({
    Key key,
    this.dueDate,
    this.directionality = TextDirection.ltr,
    this.duration = const Duration(seconds: 5),
    this.showBanner = true,
    int deadline,
    @required this.child,
    this.enabled = true,
  })  : assert(child != null),
        assert(duration != null),
        assert(directionality != null),
        assert(enabled != null),
        assert(showBanner != null),
        this.deadline = deadline ?? 0,
        super(key: key);

  @override
  _NotPaidState createState() => _NotPaidState();
}

class _NotPaidState extends State<NotPaid> {
  bool _hideBanner = false;
  double opacity;

  @override
  void initState() {
    super.initState();
    opacity = _getOpacity();
    Future.delayed(widget.duration, () {
      if (mounted) setState(() => _hideBanner = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.directionality,
      child: Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: IgnorePointer(ignoring: opacity == 0, child: widget.child),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: opacity != 1.0 && widget.showBanner && !_hideBanner
                  ? 1.0
                  : 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.center,
                color: Colors.red,
                child: Text(
                  opacity == 0
                      ? "You've reached the deadline!"
                      : 'Deadline: ${_getFormattedDate(widget.dueDate.add(Duration(days: widget.deadline)))}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  double _getOpacity() {
    if (widget.dueDate == null || !widget.enabled) return 1.0;

    if (DateTime.now().isAfter(widget.dueDate)) {
      if (widget.deadline <= 0) return 0.0;
      int delta = DateTime.now().difference(widget.dueDate).inDays;
      return delta > widget.deadline ? 0.0 : 1.0 - (delta / widget.deadline);
    }
    return 1.0;
  }
}
