//Entendendo o FlexBox no React Native | Diego Fernandes
//https://www.youtube.com/watch?v=dUkkOdhyO1w

import React from 'react';
import { View, StyleSheet, Text } from 'react-native';

export default function FlexDimensionsBasics() {
    return (
      // Try removing the `flex: 1` on the parent View.
      // The parent will not have dimensions, so the children can't expand.
      // What if you add `height: 300` instead of `flex: 1`?
      <View style={styles.container}>
        <View style={styles.box} />
        <View style={[styles.box, styles.box2]} />
        <View style={styles.box} />
        <View style={styles.box} />
        <View style={styles.box} />
      </View>
    );
};

const styles = StyleSheet.create({
  container: {
    marginTop: 30,
//    flexDirection: 'column',
    flexDirection: 'row',
    flex: 1,
    flexWrap: "wrap",
//    alignItems: 'center',
    alignContent: 'space-between',
//    justifyContent: 'space-between',
    backgroundColor:'#8d6bff'
  },

  box: {
    flex:1,
    minWidth: 100,

    height:'50%',
    backgroundColor: '#666',
    margin:2
//    alignSelf: 'center'

  },

  box2: {
//    alignSelf: 'flex-end'

  }
})
