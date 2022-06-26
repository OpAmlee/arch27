#!/usr/bin/env python
def marker(text):
    # Function to highlight the letter X
    for i, ch in enumerate(text):
        if ch.lower() == 'x':
            yield i, i, 3
