import React, { Component } from 'react';
import { View, Text, ScrollView } from 'react-native';

export default function FlexDimensionsBasics() {
    return (
      // Try removing the `flex: 1` on the parent View.
      // The parent will not have dimensions, so the children can't expand.
      // What if you add `height: 300` instead of `flex: 1`?
      <View style={{flex: 1}}>
        <View style={{flex: 1, backgroundColor: 'powderblue'}}>
          <ScrollView>
            <Text>1</Text>
            <Text>2</Text>
            <Text>3</Text>
            <Text>4</Text>
            <Text>5</Text>
            <Text>6</Text>
            <Text>7</Text>
            <Text>8</Text>
            <Text>9</Text>
            <Text>10</Text>
            <Text>11</Text>
            <Text>12</Text>
            <Text>13</Text>
            <Text>14</Text>
            <Text>15</Text>
            <Text>16</Text>
            <Text>17</Text>
            <Text>18</Text>
            <Text>19</Text>
            <Text>20</Text>
            <Text>21</Text>
            <Text>22</Text>
            <Text>23</Text>
          </ScrollView>
        </View>
        <View style={{flex: 1, backgroundColor: 'skyblue'}} />
      </View>
    );
}
