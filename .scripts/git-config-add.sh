#!/bin/bash

function ca()
{
    config add "$*"
}
function cc()
{
    config commit -m "$1"
}
