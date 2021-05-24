#import "LevelOrderTraversal.h"

NSUInteger LevelOrderTraversalForTreeNodes(NSArray *numbersTree, NSMutableArray<NSMutableArray *> *levelOrderedData, NSUInteger level, NSUInteger startIndex) {
    
    
    
    typedef enum {
        LeftNode,
        RightNode
    } NodeType;
    
    NSUInteger ptrIndex = startIndex;
    
    // начать цикл, брать левый элемент. 
    
    for (NodeType nodeType = LeftNode; nodeType <= RightNode && ptrIndex < numbersTree.count;) {
        
        NSObject *node = numbersTree[ptrIndex++];
        
        if ([node isKindOfClass:NSNumber.class]) {
            
            if (levelOrderedData.count <= level) {
                [levelOrderedData addObject:[NSMutableArray new]];
            }
            
            
            [levelOrderedData[level] addObject:node];
            
            ptrIndex = LevelOrderTraversalForTreeNodes(numbersTree, levelOrderedData, level+1, ptrIndex);
        }
        
        ++nodeType;
    }
    return ptrIndex;
}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray<NSMutableArray *> *resultArray = [NSMutableArray array];
    NSUInteger level = 0;
    
    LevelOrderTraversalForTreeNodes(tree, resultArray, level, 0);
    
    return [resultArray copy];
}
